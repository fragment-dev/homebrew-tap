require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3951.0.0-darwin-x64.tar.gz"
    sha256 "f3ae7002ccf91c4754269243ebb1ebf761cef09b77ec389ddca51298571b171f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3951.0.0-darwin-arm64.tar.gz"
      sha256 "e1c838d85cf184b3ad03539891072c913bd74e8772c9cb23f358393cf18f9527"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3951.0.0-linux-x64.tar.gz"
    sha256 "b0eb28365dbe40c87e339e5b86a3374e853a03b82fc00ce5a2dee6aac234f324"
  end
  version "3951.0.0"
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
