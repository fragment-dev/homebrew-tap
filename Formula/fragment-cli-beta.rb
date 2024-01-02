require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4243.0.0-darwin-x64.tar.gz"
    sha256 "b7841b18da6269c5f500a1f9d32568bba37d6c808c68b498bcc3c46b8e3ef960"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4243.0.0-darwin-arm64.tar.gz"
      sha256 "7b041347f984db1f1d0c3df6b4715bf76ffc0211aecca9b366b7d4cb81a07e49"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4243.0.0-linux-x64.tar.gz"
    sha256 "74c844f4775969ee6729f62cfd19821a11cae2a89d55ece4299ee23d95efc7bf"
  end
  version "4243.0.0"
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
