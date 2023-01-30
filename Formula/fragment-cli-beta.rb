require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1865.0.0-darwin-x64.tar.gz"
    sha256 "d9497ec8dd7161feda17cc503ad10cf4b14e31e7eed780b424a10254c8c293a1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1865.0.0-darwin-arm64.tar.gz"
      sha256 "a341bcfd1526ff1d4f86b302e868feca83d49dab88747a99b628b132f4aa0c41"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1865.0.0-linux-x64.tar.gz"
    sha256 "60229ac945f056845fd660bd273147d1a089da304bacb57034820415ce02e422"
  end
  version "1865.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
