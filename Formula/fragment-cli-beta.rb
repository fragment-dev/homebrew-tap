require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5422.0.0-darwin-x64.tar.gz"
    sha256 "09a8d6d8c0dc16f855b8c8c39060db64db58b30e7c3bc8f06e674aefb50aea74"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5422.0.0-darwin-arm64.tar.gz"
      sha256 "40831025a7a8689b8f29c7acdd72baf0a107fcc6911d32fad51d5b5bba9a922d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5422.0.0-linux-x64.tar.gz"
    sha256 "8dd9d6280368c20e399c0f79ad861bfc9ce1c518c8b28c3c8aea47770ae67d14"
  end
  version "5422.0.0"
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
