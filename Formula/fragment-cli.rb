require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.4.17-darwin-x64.tar.gz"
    sha256 "ec5d2dec45ab0bd04ca004e3f8d9c2d00b7efd7a6bed2bfd3a3c5a87351582a6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.4.17-darwin-arm64.tar.gz"
      sha256 "891bf7394c702a2ab4bf97646b48be63be8fbac0fe27e3b10195cc0e985d6452"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.4.17-linux-x64.tar.gz"
    sha256 "273e40f9f411262c7b0299ea234b7d6cc4850e9798b91071da20ee216427b9bf"
  end
  version "2026.4.17"
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
