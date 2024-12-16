require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5902.0.0-darwin-x64.tar.gz"
    sha256 "7b518e197a2b985cd78afbf1b4d6eac237220e0f0de502be53698833625debae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5902.0.0-darwin-arm64.tar.gz"
      sha256 "9d48dd5e2e5fa7073bd6a656bbd06653a632d88476b15a783e05d3c16d990367"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5902.0.0-linux-x64.tar.gz"
    sha256 "7a8b52b4f489ea27d3e01afe2edf5827dbe602a334f19d786ea04c4476aa4a86"
  end
  version "5902.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
