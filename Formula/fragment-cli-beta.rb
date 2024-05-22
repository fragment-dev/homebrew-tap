require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5105.0.0-darwin-x64.tar.gz"
    sha256 "ca82afc2097aa2f7f3a9d2d531889725567fd74bbc645be469fcd35712ffa935"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5105.0.0-darwin-arm64.tar.gz"
      sha256 "16c4b1f8e2fb40eefe24c21b4b9206d0dbf8d0b14dc3c952667249b96efd14f9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5105.0.0-linux-x64.tar.gz"
    sha256 "6a3d28ffaf0904367eb88a8c2bfa3568b3aeb030ee3a3b20e74973dafa44c9c9"
  end
  version "5105.0.0"
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
