require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2922.0.0-darwin-x64.tar.gz"
    sha256 "17aee5d3a9b0b9bf620634054624e99efbb8847dd70485ff01c3858bb1050bd1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2922.0.0-darwin-arm64.tar.gz"
      sha256 "537df8a0aea4fad47b959c62d698c5d27c810b3b351c45d5e6d6cf6455ea1760"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2922.0.0-linux-x64.tar.gz"
    sha256 "e5960e508654c71e20e4855cf54f36f623eed081b279f416a3636a107708a485"
  end
  version "2922.0.0"
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
