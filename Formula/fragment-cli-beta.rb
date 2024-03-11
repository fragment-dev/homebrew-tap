require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4744.0.0-darwin-x64.tar.gz"
    sha256 "be66a4f5ad06723bb2c40b3e05bb019f496567d89887ab85b57cc7d5603b4e7b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4744.0.0-darwin-arm64.tar.gz"
      sha256 "7c0667cbafc8ac452f806d463043d6df0193ed68c8113cbde1e6968d09a65f35"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4744.0.0-linux-x64.tar.gz"
    sha256 "797ad8c8b7c305d72db2bb56a991ffcf078b58edeb6b563c25990311e0d99052"
  end
  version "4744.0.0"
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
