require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4817.0.0-darwin-x64.tar.gz"
    sha256 "7e4fa2a108d2b5118cd295da52d4be69f5c52b62122b268caf8539d856760862"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4817.0.0-darwin-arm64.tar.gz"
      sha256 "c51dcb38495e53492ae79881f513b983c00e0cd1faadb812a254e979affe29a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4817.0.0-linux-x64.tar.gz"
    sha256 "d65d1d2e6e0fd76882886d565c3abf7de319e3e0086a7d1f5c283bd9fb46df53"
  end
  version "4817.0.0"
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
