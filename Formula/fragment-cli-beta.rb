require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3981.0.0-darwin-x64.tar.gz"
    sha256 "4f2ea56d822203387e25cd29c8046d5cbbcd2e432b39406557fcec4bd0d3cd03"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3981.0.0-darwin-arm64.tar.gz"
      sha256 "095f65dfa0a6e7c750f052c279ec7313de25f2b402e389cd7511e9479796191a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3981.0.0-linux-x64.tar.gz"
    sha256 "d5ae55edf6046b9057b78ead74c8be8099e6271372d509033f05f235a6831f83"
  end
  version "3981.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
