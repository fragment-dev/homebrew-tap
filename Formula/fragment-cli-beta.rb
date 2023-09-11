require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3524.0.0-darwin-x64.tar.gz"
    sha256 "d70001a347c64b43f9166d856450f580f01d290c170dd7c9607ecf9267eef8d7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3524.0.0-darwin-arm64.tar.gz"
      sha256 "44b70ce32c1fa27ec8ab03bcf59557292d6bcb8336e57260fd4611bc8e209a28"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3524.0.0-linux-x64.tar.gz"
    sha256 "2c8a3e00e786a17add37f49abac557a13f844ba3bc3e59a20effba9454a487c0"
  end
  version "3524.0.0"
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
