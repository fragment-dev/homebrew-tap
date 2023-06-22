require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2909.0.0-darwin-x64.tar.gz"
    sha256 "37f558e6172527b0802bc40a52c87596c956ecb16c09b1deccfad7d2ff1d79d3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2909.0.0-darwin-arm64.tar.gz"
      sha256 "6335c92db409910ece3b07793ea2542fc90e1754bf16e115831eb39a2cca0578"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2909.0.0-linux-x64.tar.gz"
    sha256 "64afbd0598f8cf28fefebbd467c85ea72545ed112739177d9f287a388781b3fa"
  end
  version "2909.0.0"
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
