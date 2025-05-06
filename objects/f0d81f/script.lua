weathers = {"A Perfect Day", "Downpour", "Howling Winds", "Electric Fog"}
missions = {
    {name = "fb07c0", day = "44209d"},
    {name = "d6fa0a", day = "66a084"},
    {name = "44bfd3", day = "eabbb1"},
    {name = "e42c48", day = "5a0963"},
    {name = "779a21", day = "5f8c8b"},
    {name = "b4f898", day = "dc73e4"},
    {name = "106029", day = "394856"},
    {name = "bea49d", day = "be94a0"},
    {name = "8433e6", day = "efaa08"},
    {name = "ad55fc", day = "e290bc"},
    {name = "9757f3", day = "c77f29"},
    {name = "04fe94", day = "04745c"},
    {name = "c3355d", day = "766fec"},
    {name = "06d175", day = "e6be3b"},
    {name = "56ee20", day = "b14868"},
    {name = "89ba29", day = "5f2700"},
    {name = "ee4e98", day = "0d964f"},
    {name = "2085bd", day = "322923"},
    {name = "3ea415", day = "da6259"},
    {name = "7281ea", day = "717fab"},
    {name = "a78ab8", day = "97de6e"},
    {name = "f51a45", day = "0b00e8"},
    {name = "455823", day = "35181e"},
    {name = "742cf1", day = "ff6744"},
    {name = "6430cf", day = "ada9cf"},
    {name = "beb32c", day = "6eac76"},
    {name = "512a54", day = "382712"},
    {name = "abfb82", day = "6e50c1"},
    {name = "32c52c", day = "f79b18"},
    {name = "cbd94a", day = "d44208"},
    {name = "d4905c", day = "f9c810"},
    {name = "03b36c", day = "bee14e"},
    {name = "b42633", day = "604647"},
}

function onLoad(_)
    self.createButton({
        click_function = "Day1",
        function_owner = self,
        position       = Vector(-1.226, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 1",
    })
    self.createButton({
        click_function = "Day2",
        function_owner = self,
        position       = Vector(-1.14, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 2",
    })
    self.createButton({
        click_function = "Day3",
        function_owner = self,
        position       = Vector(-1.054, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 3",
    })
    self.createButton({
        click_function = "Day4",
        function_owner = self,
        position       = Vector(-0.968, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 4",
    })
    self.createButton({
        click_function = "Day5",
        function_owner = self,
        position       = Vector(-0.882, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 5",
    })
    self.createButton({
        click_function = "Day6",
        function_owner = self,
        position       = Vector(-0.796, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 6",
    })
    self.createButton({
        click_function = "Day7",
        function_owner = self,
        position       = Vector(-0.71, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 7",
    })
    self.createButton({
        click_function = "Day8",
        function_owner = self,
        position       = Vector(-0.624, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 8",
    })
    self.createButton({
        click_function = "Day9",
        function_owner = self,
        position       = Vector(-0.538, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 9",
    })
    self.createButton({
        click_function = "Day10",
        function_owner = self,
        position       = Vector(-0.452, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 10",
    })
    self.createButton({
        click_function = "Day11",
        function_owner = self,
        position       = Vector(-0.366, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 11",
    })
    self.createButton({
        click_function = "Day12",
        function_owner = self,
        position       = Vector(-0.28, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 12",
    })
    self.createButton({
        click_function = "Day13",
        function_owner = self,
        position       = Vector(-0.194, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 13",
    })
    self.createButton({
        click_function = "Day14",
        function_owner = self,
        position       = Vector(-0.108, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 14",
    })
    self.createButton({
        click_function = "Day15",
        function_owner = self,
        position       = Vector(-0.022, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 15",
    })
    self.createButton({
        click_function = "Day16",
        function_owner = self,
        position       = Vector(0.064, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 16",
    })
    self.createButton({
        click_function = "Day17",
        function_owner = self,
        position       = Vector(0.15, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 17",
    })
    self.createButton({
        click_function = "Day18",
        function_owner = self,
        position       = Vector(0.236, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 18",
    })
    self.createButton({
        click_function = "Day19",
        function_owner = self,
        position       = Vector(0.322, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 19",
    })
    self.createButton({
        click_function = "Day20",
        function_owner = self,
        position       = Vector(0.408, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 20",
    })
    self.createButton({
        click_function = "Day21",
        function_owner = self,
        position       = Vector(0.494, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 21",
    })
    self.createButton({
        click_function = "Day22",
        function_owner = self,
        position       = Vector(0.58, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 22",
    })
    self.createButton({
        click_function = "Day23",
        function_owner = self,
        position       = Vector(0.666, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 23",
    })
    self.createButton({
        click_function = "Day24",
        function_owner = self,
        position       = Vector(0.752, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 24",
    })
    self.createButton({
        click_function = "Day25",
        function_owner = self,
        position       = Vector(0.838, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 25",
    })
    self.createButton({
        click_function = "Day26",
        function_owner = self,
        position       = Vector(0.924, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 26",
    })
    self.createButton({
        click_function = "Day27",
        function_owner = self,
        position       = Vector(1.01, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 27",
    })
    self.createButton({
        click_function = "Day28",
        function_owner = self,
        position       = Vector(1.096, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 28",
    })
    self.createButton({
        click_function = "Day29",
        function_owner = self,
        position       = Vector(1.182, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 29",
    })
    self.createButton({
        click_function = "Day30",
        function_owner = self,
        position       = Vector(1.268, 0, -0.835),
        width          = 30,
        height         = 30,
        tooltip        = "Day 30",
    })

    self.createButton({
        click_function = "null",
        position       = Vector(-1.226, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-1.14, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-1.054, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.968, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.882, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.796, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.71, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.624, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.538, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.452, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.366, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.28, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.194, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.108, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.022, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.064, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.15, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.236, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.322, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.408, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.494, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.58, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.666, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.752, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.838, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.924, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.01, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.096, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.182, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.268, 0.1, -0.825),
        width          = 0,
        height         = 0,
        font_size      = 50,
    })

    self.createButton({
        click_function = "Progress1",
        function_owner = self,
        position       = Vector(-0.242, 0, -0.553),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress2",
        function_owner = self,
        position       = Vector(-0.193, 0, -0.553),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress3",
        function_owner = self,
        position       = Vector(-0.144, 0, -0.553),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress4",
        function_owner = self,
        position       = Vector(-0.242, 0, -0.485),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress5",
        function_owner = self,
        position       = Vector(-0.193, 0, -0.485),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress6",
        function_owner = self,
        position       = Vector(-0.144, 0, -0.485),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress7",
        function_owner = self,
        position       = Vector(-0.242, 0, -0.418),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress8",
        function_owner = self,
        position       = Vector(-0.193, 0, -0.418),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress9",
        function_owner = self,
        position       = Vector(-0.144, 0, -0.418),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress10",
        function_owner = self,
        position       = Vector(-0.242, 0, -0.35),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress11",
        function_owner = self,
        position       = Vector(-0.193, 0, -0.35),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress12",
        function_owner = self,
        position       = Vector(-0.144, 0, -0.35),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress13",
        function_owner = self,
        position       = Vector(-0.242, 0, -0.282),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress14",
        function_owner = self,
        position       = Vector(-0.193, 0, -0.282),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress15",
        function_owner = self,
        position       = Vector(-0.144, 0, -0.282),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress16",
        function_owner = self,
        position       = Vector(-0.242, 0, -0.215),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress17",
        function_owner = self,
        position       = Vector(-0.193, 0, -0.215),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress18",
        function_owner = self,
        position       = Vector(-0.144, 0, -0.215),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress19",
        function_owner = self,
        position       = Vector(-0.242, 0, -0.147),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress20",
        function_owner = self,
        position       = Vector(-0.193, 0, -0.147),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress21",
        function_owner = self,
        position       = Vector(-0.144, 0, -0.147),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress22",
        function_owner = self,
        position       = Vector(-0.242, 0, -0.079),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress23",
        function_owner = self,
        position       = Vector(-0.193, 0, -0.079),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress24",
        function_owner = self,
        position       = Vector(-0.144, 0, -0.079),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress25",
        function_owner = self,
        position       = Vector(-0.242, 0, -0.012),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress26",
        function_owner = self,
        position       = Vector(-0.193, 0, -0.012),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress27",
        function_owner = self,
        position       = Vector(-0.144, 0, -0.012),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress28",
        function_owner = self,
        position       = Vector(-0.242, 0, 0.056),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress29",
        function_owner = self,
        position       = Vector(-0.193, 0, 0.056),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress30",
        function_owner = self,
        position       = Vector(-0.144, 0, 0.056),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress31",
        function_owner = self,
        position       = Vector(-0.242, 0, 0.125),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress32",
        function_owner = self,
        position       = Vector(-0.193, 0, 0.125),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress33",
        function_owner = self,
        position       = Vector(-0.144, 0, 0.125),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress34",
        function_owner = self,
        position       = Vector(0.493, 0, -0.553),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress35",
        function_owner = self,
        position       = Vector(0.541, 0, -0.553),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress36",
        function_owner = self,
        position       = Vector(0.59, 0, -0.553),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress37",
        function_owner = self,
        position       = Vector(0.493, 0, -0.485),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress38",
        function_owner = self,
        position       = Vector(0.541, 0, -0.485),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress39",
        function_owner = self,
        position       = Vector(0.59, 0, -0.485),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress40",
        function_owner = self,
        position       = Vector(0.493, 0, -0.418),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress41",
        function_owner = self,
        position       = Vector(0.541, 0, -0.418),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress42",
        function_owner = self,
        position       = Vector(0.59, 0, -0.418),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress43",
        function_owner = self,
        position       = Vector(0.493, 0, -0.35),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress44",
        function_owner = self,
        position       = Vector(0.541, 0, -0.35),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress45",
        function_owner = self,
        position       = Vector(0.59, 0, -0.35),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress46",
        function_owner = self,
        position       = Vector(0.493, 0, -0.282),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress47",
        function_owner = self,
        position       = Vector(0.541, 0, -0.282),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress48",
        function_owner = self,
        position       = Vector(0.59, 0, -0.282),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress49",
        function_owner = self,
        position       = Vector(0.493, 0, -0.215),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress50",
        function_owner = self,
        position       = Vector(0.541, 0, -0.215),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress51",
        function_owner = self,
        position       = Vector(0.59, 0, -0.215),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress52",
        function_owner = self,
        position       = Vector(0.493, 0, -0.147),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress53",
        function_owner = self,
        position       = Vector(0.541, 0, -0.147),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress54",
        function_owner = self,
        position       = Vector(0.59, 0, -0.147),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress55",
        function_owner = self,
        position       = Vector(0.493, 0, -0.079),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress56",
        function_owner = self,
        position       = Vector(0.541, 0, -0.079),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress57",
        function_owner = self,
        position       = Vector(0.59, 0, -0.079),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress58",
        function_owner = self,
        position       = Vector(0.493, 0, -0.012),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress59",
        function_owner = self,
        position       = Vector(0.541, 0, -0.012),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress60",
        function_owner = self,
        position       = Vector(0.59, 0, -0.012),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress61",
        function_owner = self,
        position       = Vector(0.493, 0, 0.056),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress62",
        function_owner = self,
        position       = Vector(0.541, 0, 0.056),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress63",
        function_owner = self,
        position       = Vector(0.59, 0, 0.056),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress64",
        function_owner = self,
        position       = Vector(0.493, 0, 0.125),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress65",
        function_owner = self,
        position       = Vector(0.541, 0, 0.125),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress66",
        function_owner = self,
        position       = Vector(0.59, 0, 0.125),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress67",
        function_owner = self,
        position       = Vector(1.218, 0, -0.553),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress68",
        function_owner = self,
        position       = Vector(1.267, 0, -0.553),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress69",
        function_owner = self,
        position       = Vector(1.315, 0, -0.553),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress70",
        function_owner = self,
        position       = Vector(1.218, 0, -0.485),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress71",
        function_owner = self,
        position       = Vector(1.267, 0, -0.485),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress72",
        function_owner = self,
        position       = Vector(1.315, 0, -0.485),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress73",
        function_owner = self,
        position       = Vector(1.218, 0, -0.418),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress74",
        function_owner = self,
        position       = Vector(1.267, 0, -0.418),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress75",
        function_owner = self,
        position       = Vector(1.315, 0, -0.418),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress76",
        function_owner = self,
        position       = Vector(1.218, 0, -0.35),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress77",
        function_owner = self,
        position       = Vector(1.267, 0, -0.35),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress78",
        function_owner = self,
        position       = Vector(1.315, 0, -0.35),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress79",
        function_owner = self,
        position       = Vector(1.218, 0, -0.282),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress80",
        function_owner = self,
        position       = Vector(1.267, 0, -0.282),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress81",
        function_owner = self,
        position       = Vector(1.315, 0, -0.282),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress82",
        function_owner = self,
        position       = Vector(1.218, 0, -0.215),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress83",
        function_owner = self,
        position       = Vector(1.267, 0, -0.215),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress84",
        function_owner = self,
        position       = Vector(1.315, 0, -0.215),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress85",
        function_owner = self,
        position       = Vector(1.218, 0, -0.147),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress86",
        function_owner = self,
        position       = Vector(1.267, 0, -0.147),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress87",
        function_owner = self,
        position       = Vector(1.315, 0, -0.147),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress88",
        function_owner = self,
        position       = Vector(1.218, 0, -0.079),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress89",
        function_owner = self,
        position       = Vector(1.267, 0, -0.079),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress90",
        function_owner = self,
        position       = Vector(1.315, 0, -0.079),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress91",
        function_owner = self,
        position       = Vector(1.218, 0, -0.012),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress92",
        function_owner = self,
        position       = Vector(1.267, 0, -0.012),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress93",
        function_owner = self,
        position       = Vector(1.315, 0, -0.012),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress94",
        function_owner = self,
        position       = Vector(1.218, 0, 0.056),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress95",
        function_owner = self,
        position       = Vector(1.267, 0, 0.056),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress96",
        function_owner = self,
        position       = Vector(1.315, 0, 0.056),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress97",
        function_owner = self,
        position       = Vector(1.218, 0, 0.125),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress98",
        function_owner = self,
        position       = Vector(1.267, 0, 0.125),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })
    self.createButton({
        click_function = "Progress99",
        function_owner = self,
        position       = Vector(1.315, 0, 0.125),
        width          = 20,
        height         = 20,
        tooltip        = "Mark Progress",
    })

    self.createButton({
        click_function = "null",
        position       = Vector(-0.242, 0.1, -0.544),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.193, 0.1, -0.544),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.144, 0.1, -0.544),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.242, 0.1, -0.474),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.193, 0.1, -0.474),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.144, 0.1, -0.474),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.242, 0.1, -0.407),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.193, 0.1, -0.407),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.144, 0.1, -0.407),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.242, 0.1, -0.339),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.193, 0.1, -0.339),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.144, 0.1, -0.339),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.242, 0.1, -0.271),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.193, 0.1, -0.271),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.144, 0.1, -0.271),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.242, 0.1, -0.204),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.193, 0.1, -0.204),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.144, 0.1, -0.204),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.242, 0.1, -0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.193, 0.1, -0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.144, 0.1, -0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.242, 0.1, -0.068),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.193, 0.1, -0.068),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.144, 0.1, -0.068),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.242, 0.1, -0.001),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.193, 0.1, -0.001),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.144, 0.1, -0.001),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.242, 0.1, 0.067),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.193, 0.1, 0.067),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.144, 0.1, 0.067),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.242, 0.1, 0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.193, 0.1, 0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(-0.144, 0.1, 0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.493, 0.1, -0.544),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.541, 0.1, -0.544),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.59, 0.1, -0.544),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.493, 0.1, -0.474),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.541, 0.1, -0.474),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.59, 0.1, -0.474),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.493, 0.1, -0.407),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.541, 0.1, -0.407),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.59, 0.1, -0.407),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.493, 0.1, -0.339),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.541, 0.1, -0.339),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.59, 0.1, -0.339),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.493, 0.1, -0.271),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.541, 0.1, -0.271),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.59, 0.1, -0.271),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.493, 0.1, -0.204),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.541, 0.1, -0.204),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.59, 0.1, -0.204),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.493, 0.1, -0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.541, 0.1, -0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.59, 0.1, -0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.493, 0.1, -0.068),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.541, 0.1, -0.068),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.59, 0.1, -0.068),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.493, 0.1, -0.001),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.541, 0.1, -0.001),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.59, 0.1, -0.001),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.493, 0.1, 0.067),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.541, 0.1, 0.067),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.59, 0.1, 0.067),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.493, 0.1, 0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.541, 0.1, 0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(0.59, 0.1, 0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.218, 0.1, -0.544),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.267, 0.1, -0.544),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.315, 0.1, -0.544),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.218, 0.1, -0.474),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.267, 0.1, -0.474),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.315, 0.1, -0.474),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.218, 0.1, -0.407),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.267, 0.1, -0.407),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.315, 0.1, -0.407),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.218, 0.1, -0.339),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.267, 0.1, -0.339),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.315, 0.1, -0.339),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.218, 0.1, -0.271),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.267, 0.1, -0.271),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.315, 0.1, -0.271),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.218, 0.1, -0.204),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.267, 0.1, -0.204),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.315, 0.1, -0.204),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.218, 0.1, -0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.267, 0.1, -0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.315, 0.1, -0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.218, 0.1, -0.068),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.267, 0.1, -0.068),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.315, 0.1, -0.068),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.218, 0.1, -0.001),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.267, 0.1, -0.001),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.315, 0.1, -0.001),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.218, 0.1, 0.067),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.267, 0.1, 0.067),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.315, 0.1, 0.067),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.218, 0.1, 0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.267, 0.1, 0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })
    self.createButton({
        click_function = "null",
        position       = Vector(1.315, 0.1, 0.136),
        width          = 0,
        height         = 0,
        font_size      = 100,
    })

    local campaign = Global.getVar("campaign")
    if campaign == 0 then
        self.createButton({
            click_function = "prologue",
            function_owner = self,
            label          = "Prologue",
            position       = Vector(0, 0.1, -0.15),
            width          = 350,
            height         = 50,
            font_size      = 50,
            font_color     = Color.White,
            color          = Color.fromHex("397f6d"),
            hover_color    = Color.fromHex("2b715f"),
            press_color    = Color.fromHex("1d6551"),
        })
        self.createButton({
            click_function = "campaign",
            function_owner = self,
            label          = "Campaign",
            position       = Vector(0, 0.1, 0.15),
            width          = 350,
            height         = 50,
            font_size      = 50,
            font_color     = Color.White,
            color          = Color.fromHex("397f6d"),
            hover_color    = Color.fromHex("2b715f"),
            press_color    = Color.fromHex("1d6551"),
        })
        self.createButton({
            click_function = "import",
            function_owner = self,
            label          = "Import",
            position       = Vector(0, 0.1, 0.45),
            width          = 350,
            height         = 50,
            font_size      = 50,
            font_color     = Color.White,
            color          = Color.fromHex("397f6d"),
            hover_color    = Color.fromHex("2b715f"),
            press_color    = Color.fromHex("1d6551"),
        })
    elseif campaign == 1 then
        if getObjectFromGUID("c72426") then
            self.createButton({
                click_function = "null",
                function_owner = self,
                label          = "",
                position       = Vector(0, 0.1, -0.15),
                width          = 0,
                height         = 0,
                font_size      = 50,
                font_color     = Color.White,
                color          = Color.fromHex("397f6d"),
                hover_color    = Color.fromHex("2b715f"),
                press_color    = Color.fromHex("1d6551"),
            })
        else
            self.createButton({
                click_function = "grabCalypsa",
                function_owner = self,
                label          = "Grab Calypsa",
                position       = Vector(0, 0.1, -0.15),
                width          = 350,
                height         = 50,
                font_size      = 50,
                font_color     = Color.White,
                color          = Color.fromHex("397f6d"),
                hover_color    = Color.fromHex("2b715f"),
                press_color    = Color.fromHex("1d6551"),
            })
        end
        self.createButton({
            click_function = "endPrologue",
            function_owner = self,
            label          = "Campaign",
            position       = Vector(0, 0.1, 0.15),
            width          = 350,
            height         = 50,
            font_size      = 50,
            font_color     = Color.White,
            color          = Color.fromHex("397f6d"),
            hover_color    = Color.fromHex("2b715f"),
            press_color    = Color.fromHex("1d6551"),
            tooltip        = "End Prologue and Start Campaign",
        })
    end

    setDay()
    setProgress()
end

function Day1(_, _, alt_click)
    local index = 1
    local weather = 1
    markDay(index, weather, alt_click)
end
function Day2(_, _, alt_click)
    local index = 2
    local weather = 1
    markDay(index, weather, alt_click)
    if not alt_click then
        broadcastToAll("Don't forget to read campaign guide entry 94.1!", Color.White)
    end
end
function Day3(_, _, alt_click)
    local index = 3
    local weather
    if alt_click then
        weather = 1
    else
        weather = 2
    end
    markDay(index, weather, alt_click)
    if not alt_click then
        broadcastToAll("Don't forget to read campaign guide entry 1.04!", Color.White)
    end
end
function Day4(_, _, alt_click)
    local index = 4
    local weather = 2
    markDay(index, weather, alt_click)
end
function Day5(_, _, alt_click)
    local index = 5
    local weather = 2
    markDay(index, weather, alt_click)
end
function Day6(_, _, alt_click)
    local index = 6
    local weather = 2
    markDay(index, weather, alt_click)
end
function Day7(_, _, alt_click)
    local index = 7
    local weather
    if alt_click then
        weather = 2
    else
        weather = 1
    end
    markDay(index, weather, alt_click)
end
function Day8(_, _, alt_click)
    local index = 8
    local weather = 1
    markDay(index, weather, alt_click)
end
function Day9(_, _, alt_click)
    local index = 9
    local weather
    if alt_click then
        weather = 1
    else
        weather = 2
    end
    markDay(index, weather, alt_click)
end
function Day10(_, _, alt_click)
    local index = 10
    local weather = 2
    markDay(index, weather, alt_click)
end
function Day11(_, _, alt_click)
    local index = 11
    local weather = 2
    markDay(index, weather, alt_click)
end
function Day12(_, _, alt_click)
    local index = 12
    local weather
    if alt_click then
        weather = 2
    else
        weather = 3
    end
    markDay(index, weather, alt_click)
end
function Day13(_, _, alt_click)
    local index = 13
    local weather = 3
    markDay(index, weather, alt_click)
end
function Day14(_, _, alt_click)
    local index = 14
    local weather
    if alt_click then
        weather = 3
    else
        weather = 2
    end
    markDay(index, weather, alt_click)
end
function Day15(_, _, alt_click)
    local index = 15
    local weather = 2
    markDay(index, weather, alt_click)
end
function Day16(_, _, alt_click)
    local index = 16
    local weather = 2
    markDay(index, weather, alt_click)
end
function Day17(_, _, alt_click)
    local index = 17
    local weather
    if alt_click then
        weather = 2
    else
        weather = 3
    end
    markDay(index, weather, alt_click)
end
function Day18(_, _, alt_click)
    local index = 18
    local weather = 3
    markDay(index, weather, alt_click)
end
function Day19(_, _, alt_click)
    local index = 19
    local weather = 3
    markDay(index, weather, alt_click)
end
function Day20(_, _, alt_click)
    local index = 20
    local weather
    if alt_click then
        weather = 3
    else
        weather = 1
    end
    markDay(index, weather, alt_click)
end
function Day21(_, _, alt_click)
    local index = 21
    local weather = 1
    markDay(index, weather, alt_click)
end
function Day22(_, _, alt_click)
    local index = 22
    local weather
    if alt_click then
        weather = 1
    else
        weather = 2
    end
    markDay(index, weather, alt_click)
end
function Day23(_, _, alt_click)
    local index = 23
    local weather = 2
    markDay(index, weather, alt_click)
end
function Day24(_, _, alt_click)
    local index = 24
    local weather = 2
    markDay(index, weather, alt_click)
end
function Day25(_, _, alt_click)
    local index = 25
    local weather
    if alt_click then
        weather = 2
    else
        weather = 3
    end
    markDay(index, weather, alt_click)
end
function Day26(_, _, alt_click)
    local index = 26
    local weather = 3
    markDay(index, weather, alt_click)
end
function Day27(_, _, alt_click)
    local index = 27
    local weather = 3
    markDay(index, weather, alt_click)
end
function Day28(_, _, alt_click)
    local index = 28
    local weather
    if alt_click then
        weather = 3
    else
        weather = 1
    end
    markDay(index, weather, alt_click)
end
function Day29(_, _, alt_click)
    local index = 29
    local weather = 1
    markDay(index, weather, alt_click)
end
function Day30(_, _, alt_click)
    local index = 30
    local weather = 1
    if alt_click then
        markDay(index, weather, alt_click)
    else
        broadcastToAll("Day 30 is finished, the Campaign is now completed", Color.White)
    end
end

function markDay(index, weather, alt_click)
    local newWeather
    if Global.getVar("hardWeather") then
        newWeather = weathers[weather + 1]
    else
        newWeather = weathers[weather]
    end

    local offset = 30
    local label
    local newDay
    if alt_click then
        label = ""
        newDay = index
    else
        label = "X"
        newDay = index + 1
    end

    self.editButton({index = index + offset - 1, label = label})
    Global.setVar("currentWeather", newWeather)
    Global.setVar("currentDay", newDay)
end

function setDay()
    local currentDay = Global.getVar("currentDay")
    local offset = 30

    for index = 1, currentDay - 1 do
        self.editButton({index = index + offset - 1, label = "X"})
    end
end

function Progress1(_, _, alt_click)
    local index = 1
    markProgress(index, alt_click)
end
function Progress2(_, _, alt_click)
    local index = 2
    markProgress(index, alt_click)
end
function Progress3(_, _, alt_click)
    local index = 3
    markProgress(index, alt_click)
end
function Progress4(_, _, alt_click)
    local index = 4
    markProgress(index, alt_click)
end
function Progress5(_, _, alt_click)
    local index = 5
    markProgress(index, alt_click)
end
function Progress6(_, _, alt_click)
    local index = 6
    markProgress(index, alt_click)
end
function Progress7(_, _, alt_click)
    local index = 7
    markProgress(index, alt_click)
end
function Progress8(_, _, alt_click)
    local index = 8
    markProgress(index, alt_click)
end
function Progress9(_, _, alt_click)
    local index = 9
    markProgress(index, alt_click)
end
function Progress10(_, _, alt_click)
    local index = 10
    markProgress(index, alt_click)
end
function Progress11(_, _, alt_click)
    local index = 11
    markProgress(index, alt_click)
end
function Progress12(_, _, alt_click)
    local index = 12
    markProgress(index, alt_click)
end
function Progress13(_, _, alt_click)
    local index = 13
    markProgress(index, alt_click)
end
function Progress14(_, _, alt_click)
    local index = 14
    markProgress(index, alt_click)
end
function Progress15(_, _, alt_click)
    local index = 15
    markProgress(index, alt_click)
end
function Progress16(_, _, alt_click)
    local index = 16
    markProgress(index, alt_click)
end
function Progress17(_, _, alt_click)
    local index = 17
    markProgress(index, alt_click)
end
function Progress18(_, _, alt_click)
    local index = 18
    markProgress(index, alt_click)
end
function Progress19(_, _, alt_click)
    local index = 19
    markProgress(index, alt_click)
end
function Progress20(_, _, alt_click)
    local index = 20
    markProgress(index, alt_click)
end
function Progress21(_, _, alt_click)
    local index = 21
    markProgress(index, alt_click)
end
function Progress22(_, _, alt_click)
    local index = 22
    markProgress(index, alt_click)
end
function Progress23(_, _, alt_click)
    local index = 23
    markProgress(index, alt_click)
end
function Progress24(_, _, alt_click)
    local index = 24
    markProgress(index, alt_click)
end
function Progress25(_, _, alt_click)
    local index = 25
    markProgress(index, alt_click)
end
function Progress26(_, _, alt_click)
    local index = 26
    markProgress(index, alt_click)
end
function Progress27(_, _, alt_click)
    local index = 27
    markProgress(index, alt_click)
end
function Progress28(_, _, alt_click)
    local index = 28
    markProgress(index, alt_click)
end
function Progress29(_, _, alt_click)
    local index = 29
    markProgress(index, alt_click)
end
function Progress30(_, _, alt_click)
    local index = 30
    markProgress(index, alt_click)
end
function Progress31(_, _, alt_click)
    local index = 31
    markProgress(index, alt_click)
end
function Progress32(_, _, alt_click)
    local index = 32
    markProgress(index, alt_click)
end
function Progress33(_, _, alt_click)
    local index = 33
    markProgress(index, alt_click)
end
function Progress34(_, _, alt_click)
    local index = 34
    markProgress(index, alt_click)
end
function Progress35(_, _, alt_click)
    local index = 35
    markProgress(index, alt_click)
end
function Progress36(_, _, alt_click)
    local index = 36
    markProgress(index, alt_click)
end
function Progress37(_, _, alt_click)
    local index = 37
    markProgress(index, alt_click)
end
function Progress38(_, _, alt_click)
    local index = 38
    markProgress(index, alt_click)
end
function Progress39(_, _, alt_click)
    local index = 39
    markProgress(index, alt_click)
end
function Progress40(_, _, alt_click)
    local index = 40
    markProgress(index, alt_click)
end
function Progress41(_, _, alt_click)
    local index = 41
    markProgress(index, alt_click)
end
function Progress42(_, _, alt_click)
    local index = 42
    markProgress(index, alt_click)
end
function Progress43(_, _, alt_click)
    local index = 43
    markProgress(index, alt_click)
end
function Progress44(_, _, alt_click)
    local index = 44
    markProgress(index, alt_click)
end
function Progress45(_, _, alt_click)
    local index = 45
    markProgress(index, alt_click)
end
function Progress46(_, _, alt_click)
    local index = 46
    markProgress(index, alt_click)
end
function Progress47(_, _, alt_click)
    local index = 47
    markProgress(index, alt_click)
end
function Progress48(_, _, alt_click)
    local index = 48
    markProgress(index, alt_click)
end
function Progress49(_, _, alt_click)
    local index = 49
    markProgress(index, alt_click)
end
function Progress50(_, _, alt_click)
    local index = 50
    markProgress(index, alt_click)
end
function Progress51(_, _, alt_click)
    local index = 51
    markProgress(index, alt_click)
end
function Progress52(_, _, alt_click)
    local index = 52
    markProgress(index, alt_click)
end
function Progress53(_, _, alt_click)
    local index = 53
    markProgress(index, alt_click)
end
function Progress54(_, _, alt_click)
    local index = 54
    markProgress(index, alt_click)
end
function Progress55(_, _, alt_click)
    local index = 55
    markProgress(index, alt_click)
end
function Progress56(_, _, alt_click)
    local index = 56
    markProgress(index, alt_click)
end
function Progress57(_, _, alt_click)
    local index = 57
    markProgress(index, alt_click)
end
function Progress58(_, _, alt_click)
    local index = 58
    markProgress(index, alt_click)
end
function Progress59(_, _, alt_click)
    local index = 59
    markProgress(index, alt_click)
end
function Progress60(_, _, alt_click)
    local index = 60
    markProgress(index, alt_click)
end
function Progress61(_, _, alt_click)
    local index = 61
    markProgress(index, alt_click)
end
function Progress62(_, _, alt_click)
    local index = 62
    markProgress(index, alt_click)
end
function Progress63(_, _, alt_click)
    local index = 63
    markProgress(index, alt_click)
end
function Progress64(_, _, alt_click)
    local index = 64
    markProgress(index, alt_click)
end
function Progress65(_, _, alt_click)
    local index = 65
    markProgress(index, alt_click)
end
function Progress66(_, _, alt_click)
    local index = 66
    markProgress(index, alt_click)
end
function Progress67(_, _, alt_click)
    local index = 67
    markProgress(index, alt_click)
end
function Progress68(_, _, alt_click)
    local index = 68
    markProgress(index, alt_click)
end
function Progress69(_, _, alt_click)
    local index = 69
    markProgress(index, alt_click)
end
function Progress70(_, _, alt_click)
    local index = 70
    markProgress(index, alt_click)
end
function Progress71(_, _, alt_click)
    local index = 71
    markProgress(index, alt_click)
end
function Progress72(_, _, alt_click)
    local index = 72
    markProgress(index, alt_click)
end
function Progress73(_, _, alt_click)
    local index = 73
    markProgress(index, alt_click)
end
function Progress74(_, _, alt_click)
    local index = 74
    markProgress(index, alt_click)
end
function Progress75(_, _, alt_click)
    local index = 75
    markProgress(index, alt_click)
end
function Progress76(_, _, alt_click)
    local index = 76
    markProgress(index, alt_click)
end
function Progress77(_, _, alt_click)
    local index = 77
    markProgress(index, alt_click)
end
function Progress78(_, _, alt_click)
    local index = 78
    markProgress(index, alt_click)
end
function Progress79(_, _, alt_click)
    local index = 79
    markProgress(index, alt_click)
end
function Progress80(_, _, alt_click)
    local index = 80
    markProgress(index, alt_click)
end
function Progress81(_, _, alt_click)
    local index = 81
    markProgress(index, alt_click)
end
function Progress82(_, _, alt_click)
    local index = 82
    markProgress(index, alt_click)
end
function Progress83(_, _, alt_click)
    local index = 83
    markProgress(index, alt_click)
end
function Progress84(_, _, alt_click)
    local index = 84
    markProgress(index, alt_click)
end
function Progress85(_, _, alt_click)
    local index = 85
    markProgress(index, alt_click)
end
function Progress86(_, _, alt_click)
    local index = 86
    markProgress(index, alt_click)
end
function Progress87(_, _, alt_click)
    local index = 87
    markProgress(index, alt_click)
end
function Progress88(_, _, alt_click)
    local index = 88
    markProgress(index, alt_click)
end
function Progress89(_, _, alt_click)
    local index = 89
    markProgress(index, alt_click)
end
function Progress90(_, _, alt_click)
    local index = 90
    markProgress(index, alt_click)
end
function Progress91(_, _, alt_click)
    local index = 91
    markProgress(index, alt_click)
end
function Progress92(_, _, alt_click)
    local index = 92
    markProgress(index, alt_click)
end
function Progress93(_, _, alt_click)
    local index = 93
    markProgress(index, alt_click)
end
function Progress94(_, _, alt_click)
    local index = 94
    markProgress(index, alt_click)
end
function Progress95(_, _, alt_click)
    local index = 95
    markProgress(index, alt_click)
end
function Progress96(_, _, alt_click)
    local index = 96
    markProgress(index, alt_click)
end
function Progress97(_, _, alt_click)
    local index = 97
    markProgress(index, alt_click)
end
function Progress98(_, _, alt_click)
    local index = 98
    markProgress(index, alt_click)
end
function Progress99(_, _, alt_click)
    local index = 99
    markProgress(index, alt_click)
end

function markProgress(index, alt_click)
    local initialOffset = 59
    local offset = 99

    local label
    local progress
    if alt_click then
        label = ""
        progress = -1
    else
        label = "·"
        progress = 1
    end

    local missionProgress = Global.getTable("missionProgress")
    local mission = math.floor((index - 1) / 3) + 1
    if not missionProgress[mission] then
        missionProgress[mission] = 0
    end
    missionProgress[mission] = missionProgress[mission] + progress
    if missionProgress[mission] == 0 then
        missionProgress[mission] = nil
    end
    Global.setTable("missionProgress", missionProgress)

    self.editButton({index = index + initialOffset + offset, label = label})
end

function setProgress()
    local initialOffset = 59
    local offset = 99

    local missionProgress = Global.getTable("missionProgress")
    for index, progress in pairs(missionProgress) do
        for i = 1, progress do
            self.editButton({index = (index - 1) * 3 + initialOffset + offset + i, label = "·"})
        end
    end
end

function prologue(_, _, _)
    Global.setVar("campaign", 1)
    Global.call("StartTheDay")

    -- Traveling to location after starting the day
    local valleyMap = Global.getVar("valleyMap")
    valleyMap.call("Travel", {location = "Ancestor's Grove", connection = "Woods"})

    local buttons = self.getButtons()
    self.removeButton(buttons[#buttons].index)
    self.editButton({index = buttons[#buttons - 2].index, click_function = "grabCalypsa", label = "Grab Calypsa"})
    self.editButton({index = buttons[#buttons - 1].index, click_function = "endPrologue", tooltip = "End Prologue and Start Campaign"})
end
function campaign(_, _, _)
    Global.setVar("campaign", 2)
    Global.call("StartTheDay")

    -- Traveling to location after starting the day
    local valleyMap = Global.getVar("valleyMap")
    valleyMap.call("Travel", {location = "Lone Tree Station", connection = "Woods"})

    local buttons = self.getButtons()
    self.removeButton(buttons[#buttons].index)
    self.removeButton(buttons[#buttons - 1].index)
    self.removeButton(buttons[#buttons - 2].index)
end
function import(_, _, _)
    local config
    for _,data in pairs(Notes.getNotebookTabs()) do
        if data.title == "Campaign Export" then
            if data.body == "" then
                broadcastToAll("Campaign Export is empty", Color.Red)
                return
            end
            config = JSON.decode(data.body)
            break
        end
    end

    local hardWeather = Global.getVar("hardWeather")
    local showRewards = Global.getVar("showRewards")
    local recallBoxes = Global.getTable("recallBoxes")

    Global.setVar("currentLocation", config.currentLocation)
    Global.setVar("currentWeather", config.currentWeather)
    Global.setVar("currentDay", config.currentDay)
    if hardWeather ~= config.hardWeather then
        Global.getVar("weatherBox").call("toggleWeather")
    end
    if showRewards ~= config.showRewards then
        recallBoxes[5].call("toggleRewards")
    end
    Global.setVar("campaign", config.campaign)
    Global.setTable("unlockedRewards", config.unlockedRewards)
    Global.setTable("missionProgress", config.missionProgress)
    Global.setTable("completedMissions", config.completedMissions)

    for _, player in pairs(config.players) do
        recallBoxes[6].call("ImportDeck", player)
    end

    local pathBox = Global.getVar("pathBox")
    local trash = Global.getVar("trash")
    for _, name in pairs(config.trash) do
        local card = pathBox.call("GrabPath", {path = name, position = pathBox.getPosition() + Vector(0, 0, -7)})
        trash.putObject(card)
    end

    getObjectFromGUID("9d87f9").setValue(config.tracker.rangers)
    getObjectFromGUID("ca8d6d").setValue(config.tracker.events1)
    getObjectFromGUID("f44bc1").setValue(config.tracker.events2)

    local missionBox = Global.getVar("missionBox")
    for i, mission in pairs(config.tracker.missions) do
        getObjectFromGUID(missions[i].name).setValue(mission.name)
        getObjectFromGUID(missions[i].day).setValue(mission.day)
        if not config.completedMissions[i] then
            missionBox.call("GrabMission", {mission = mission.name})
        end
    end

    setDay()
    setProgress()
    for i, complete in pairs(config.completedMissions) do
        if complete then
            local name = getObjectFromGUID(missions[i].name)
            local data = name.getData()
            data.Text.Text = "───────────────"
            spawnObjectData({data = data, position = name.getPosition() + Vector(0.35, 0, 0)})
        end
    end
    for _, mission in pairs(config.completedMissions) do
        Global.call("CompleteMission", {missionName = mission, import = true})
    end
    getObjectFromGUID("9815de").setValue(config.currentLocation)
    getObjectFromGUID("0b7329").setValue(config.tracker.connection)
    Global.getVar("valleyMap").call("setLocation")

    local unlockedRewards = {}
    for name, _ in pairs(config.unlockedRewards) do
        table.insert(unlockedRewards, name)
    end
    if #unlockedRewards > 0 then
        local rewardIndex = 1
        local rewardGUIDs = {"b5ebd3", "b0f97f", "c4ffae"}
        for index, rewardGUID in pairs(rewardGUIDs) do
            local rewards = getObjectFromGUID(rewardGUID)
            local text = rewards.getValue()
            if text == " " then
                rewards.setValue(unlockedRewards[rewardIndex])
                if rewardIndex < #unlockedRewards then
                    rewardIndex = rewardIndex + 1
                else
                    break
                end
            else
                local _, count = text:gsub("\n", "")
                if count < 10 or (index == 1 and count == 10) then
                    rewards.setValue(text.."\n"..unlockedRewards[rewardIndex])
                    if rewardIndex < #unlockedRewards then
                        rewardIndex = rewardIndex + 1
                    else
                        break
                    end
                end
            end
        end
    end

    local buttons = self.getButtons()
    self.removeButton(buttons[#buttons].index)
    self.removeButton(buttons[#buttons - 1].index)
    self.removeButton(buttons[#buttons - 2].index)
end
function grabCalypsa(_, color, _)
    local playerBoards = Global.getTable("playerBoards")
    local playerBoard = playerBoards[color]
    if not playerBoard then
        return
    end

    local pathBox = Global.getVar("pathBox")
    for _, obj in pairs(pathBox.getObjects()) do
        if obj.name == "The Valley Set" then
            local pathSet = pathBox.takeObject({guid = obj.guid})
            local position = playerBoard.getPosition() + Vector(0, 1, 4.1)
            pathSet.takeObject({guid = "c72426", position = position, rotation = Vector(0, 180, 0)})
            pathBox.putObject(pathSet)
            break
        end
    end

    -- Hide calypsa button since there's only one copy, and that way we can delete both buttons when starting campaign
    local buttons = self.getButtons()
    self.editButton({index = buttons[#buttons - 2].index, click_function = "null", label = "", height = 0, width = 0})
end
function endPrologue(_, _, _)
    Global.setVar("prologue", false)
    Global.call("EndTheDay")
    -- EndTheDay doesn't remove location
    local locationBox = Global.getVar("locationBox")
    for _, locationCard in pairs(getObjectsWithTag("Location")) do
        locationCard.setLock(false)
        locationCard.setRotation(Vector(0, 180, 0))
        locationBox.putObject(locationCard)
    end

    Wait.frames(function() campaign() end, 10)
end
