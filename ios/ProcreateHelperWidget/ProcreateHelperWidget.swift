import WidgetKit
import SwiftUI

// Timeline Provider for the widget
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        let entry = SimpleEntry(date: Date())
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

// Entry model for the widget
struct SimpleEntry: TimelineEntry {
    let date: Date
}

// Widget view implementation
struct ProcreateHelperWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(spacing: 8) {
            // Header
            HStack {
                Image(systemName: "paintbrush.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
                Text("Procreate Helper")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding(.top, 4)
            
            // Action buttons grid
            VStack(spacing: 6) {
                HStack(spacing: 6) {
                    // Undo button
                    Link(destination: URL(string: "procreatehelper://undo")!) {
                        VStack(spacing: 2) {
                            Image(systemName: "arrow.uturn.backward")
                                .font(.system(size: 16, weight: .medium))
                            Text("Undo")
                                .font(.system(size: 10, weight: .medium))
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                    }
                    
                    // Redo button
                    Link(destination: URL(string: "procreatehelper://redo")!) {
                        VStack(spacing: 2) {
                            Image(systemName: "arrow.uturn.forward")
                                .font(.system(size: 16, weight: .medium))
                            Text("Redo")
                                .font(.system(size: 10, weight: .medium))
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                    }
                }
                .frame(height: 35)
                
                HStack(spacing: 6) {
                    // Brush button
                    Link(destination: URL(string: "procreatehelper://brush")!) {
                        VStack(spacing: 2) {
                            Image(systemName: "paintbrush")
                                .font(.system(size: 16, weight: .medium))
                            Text("Brush")
                                .font(.system(size: 10, weight: .medium))
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .cornerRadius(8)
                    }
                    
                    // Eraser button
                    Link(destination: URL(string: "procreatehelper://eraser")!) {
                        VStack(spacing: 2) {
                            Image(systemName: "eraser")
                                .font(.system(size: 16, weight: .medium))
                            Text("Eraser")
                                .font(.system(size: 10, weight: .medium))
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(8)
                    }
                }
                .frame(height: 35)
            }
            
            Spacer(minLength: 0)
        }
        .padding(8)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.2, green: 0.1, blue: 0.3), Color(red: 0.4, green: 0.2, blue: 0.5)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(12)
    }
}

// Main widget configuration
@main
struct ProcreateHelperWidget: Widget {
    let kind: String = "ProcreateHelperWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ProcreateHelperWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Procreate Helper")
        .description("Quick access to Procreate controls with Undo, Redo, Brush, and Eraser buttons.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}