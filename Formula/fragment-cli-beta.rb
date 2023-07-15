require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3077.0.0-darwin-x64.tar.gz"
    sha256 "369c75e162932116c69d15d7b79b794c5b98e6cb0030ef722819d3727c7b7a2a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3077.0.0-darwin-arm64.tar.gz"
      sha256 "d8491d6847480d337d747c319df805c5ac737924cf8c5ca7167980951b34d9b1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3077.0.0-linux-x64.tar.gz"
    sha256 "24a367a0d34c079315148ca641d887a8546538b4cd90901bbe4f845836778815"
  end
  version "3077.0.0"
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
