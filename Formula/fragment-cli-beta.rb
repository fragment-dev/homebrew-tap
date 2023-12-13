require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4150.0.0-darwin-x64.tar.gz"
    sha256 "843daaf98151779f188e69c014c6c0ada76896f4ffd2050f15f5b2e70447f39c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4150.0.0-darwin-arm64.tar.gz"
      sha256 "65c4490de39ce715d303ae0f96876f050df63c6bc5a4c5f66a7576b61a9076a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4150.0.0-linux-x64.tar.gz"
    sha256 "9b0b9c101c21ebab0e7c488a5e7f66a090e5ef834818e75379be0c3da15626fb"
  end
  version "4150.0.0"
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
