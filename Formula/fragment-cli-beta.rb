require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3595.0.0-darwin-x64.tar.gz"
    sha256 "5244c27d8274cb5b3652feaec92b12e3cd9fd7cdd78d6d61ea71b9431d05561f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3595.0.0-darwin-arm64.tar.gz"
      sha256 "9d322bac75ee3c583b54779556e2a2191da000033d595d2b8b3461435c672fa8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3595.0.0-linux-x64.tar.gz"
    sha256 "65a36125a762961dc8947f981665cbc540ef011474069596c9ebc87936776b2f"
  end
  version "3595.0.0"
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
