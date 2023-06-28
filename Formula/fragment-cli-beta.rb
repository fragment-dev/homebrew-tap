require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2969.0.0-darwin-x64.tar.gz"
    sha256 "a27b19176eaefd55674442bef650ced84d5f05fe9ca6b8c64819b35b9f4ba3f2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2969.0.0-darwin-arm64.tar.gz"
      sha256 "bfb1d8ed2cfefa2e72c04eb42276ff528ba4f91c3a4aae9163008763b3683d67"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2969.0.0-linux-x64.tar.gz"
    sha256 "1b686a2174d33ad229ba1f4cb455cc342f6c8e5a0b92fff1dff4127e67118f1c"
  end
  version "2969.0.0"
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
