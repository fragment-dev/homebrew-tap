require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3993.0.0-darwin-x64.tar.gz"
    sha256 "3ace422f82d511ec85cdc27b28a0815daa2f05767085f7b2ba1842cb2fc1f1d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3993.0.0-darwin-arm64.tar.gz"
      sha256 "c9116c134a3838658ec68ba4151117a661025d6f91f9c3c09882d86f05d07379"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3993.0.0-linux-x64.tar.gz"
    sha256 "b72b5aa4e427fd40503d1a1ef2203153e0862c6e095ab9e62df60424e4d0171f"
  end
  version "3993.0.0"
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
