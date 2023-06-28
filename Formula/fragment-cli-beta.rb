require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2959.0.0-darwin-x64.tar.gz"
    sha256 "a0c00b6212ffab5981205f42fde1e7d39cccc36031f26b814bb9b209f762646f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2959.0.0-darwin-arm64.tar.gz"
      sha256 "004bae222e13dcf50cb1b87bcf647f392d84e9c4f4fec0aa57e2a34f26b01918"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2959.0.0-linux-x64.tar.gz"
    sha256 "effcc072e434fa375c684894fc360439e22d74f045a22b2a1e9ad9cf422f16c2"
  end
  version "2959.0.0"
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
