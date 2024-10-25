require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5708.0.0-darwin-x64.tar.gz"
    sha256 "ec8255f8f4f5d8816e322bfca089d6183b8383cebc293c3594fe251d561fa1df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5708.0.0-darwin-arm64.tar.gz"
      sha256 "eacb35e0cff29e6776058ffcdf2c5a8ee345aba52f6b6b97ba75bda96ad39967"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5708.0.0-linux-x64.tar.gz"
    sha256 "2c45ea1a352619a46e720a3b9044376815bdedb8e1c18c52dd24fa54468503bf"
  end
  version "5708.0.0"
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
