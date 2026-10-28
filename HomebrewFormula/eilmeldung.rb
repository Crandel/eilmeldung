class Eilmeldung < Formula
  desc "a feature-rich TUI RSS reader based on the newsflash library"
  homepage "https://github.com/christo-auer/eilmeldung"
  url "https://github.com/christo-auer/eilmeldung/archive/refs/tags/1.10.0.tar.gz"
  sha256 "3e4f875eef140f223a107a995aff3a225692dc4bcaa26e0c7f9171cc48ca2a46"
  license "GPL-3.0"
  head "https://github.com/christo-auer/eilmeldung.git", branch: "main"
  version "1.10.0"

  depends_on "rust" => :build

  on_linux do
    depends_on "llvm" => :build
  end
  
  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "eilmeldung #{version}", shell_output("#{bin}/eilmeldung --version").strip
  end


end
