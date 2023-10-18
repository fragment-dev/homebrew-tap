require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3865.0.0-darwin-x64.tar.gz"
    sha256 "83b47231d4f84c4a042501a4994893b37c47a8393a90199a82f9994ac814a350"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3865.0.0-darwin-arm64.tar.gz"
      sha256 "c64b87379bb2df34b58d5d0be98db25c376feae5d3cdd37bcbaa34af177edc5d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3865.0.0-linux-x64.tar.gz"
    sha256 "d0b9f2e5faf8580e970636853af206efa8c5ae2f9bc37c18fc7039267a39ca20"
  end
  version "3865.0.0"
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
