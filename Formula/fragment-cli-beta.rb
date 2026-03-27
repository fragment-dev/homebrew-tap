require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8148.0.0-darwin-x64.tar.gz"
    sha256 "09bcec794aa3708af903360604c59469d88de1a9a365682dc0c3b2507c241512"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8148.0.0-darwin-arm64.tar.gz"
      sha256 "7f3587fd727cd4f9c58adac178c1f90b0a76fd578e62530ac6b52e94ae03da9d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8148.0.0-linux-x64.tar.gz"
    sha256 "3c4fd9b2b77c88ca920081f296097124d4a1782dad44d0cd89e1db45a6c9b6c9"
  end
  version "8148.0.0"
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
