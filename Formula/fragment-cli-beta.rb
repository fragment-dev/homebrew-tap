require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4426.0.0-darwin-x64.tar.gz"
    sha256 "3f7907957d2c104baa139017ef9bf3a725bd641205cd09fb57816827e1058bbc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4426.0.0-darwin-arm64.tar.gz"
      sha256 "bf6afeb7dde247baa5f6f422db02dd0d2c85222270cd98a10c9bfe9295ef88e7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4426.0.0-linux-x64.tar.gz"
    sha256 "896098268fa91f110767650ca38e2e5f2c598c6c969aa1ddca82f4bbd655bbee"
  end
  version "4426.0.0"
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
