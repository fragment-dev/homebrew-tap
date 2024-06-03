require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5176.0.0-darwin-x64.tar.gz"
    sha256 "58d3d9593004eeb16d5a40be4e436f7041c2a89c273191a46c8b8b8ac80c8a08"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5176.0.0-darwin-arm64.tar.gz"
      sha256 "d7f63bd0b14fce53964ef44b84ab338b1dab2f7286a8f04d91ebf0dc95b3ccd9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5176.0.0-linux-x64.tar.gz"
    sha256 "b0995f4fb8f2f63de2e26b7ddb00dd47037d874b93560f3625e04c95466fe1b1"
  end
  version "5176.0.0"
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
