require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4070.0.0-darwin-x64.tar.gz"
    sha256 "f31bb9121a094ab965433cc2edd92c50f6bffc8b1357d80cd5a9b62771e0b207"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4070.0.0-darwin-arm64.tar.gz"
      sha256 "7e77579b258a802efc367f2f076f7516e211df1230966f667e235ddaec51cfd1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4070.0.0-linux-x64.tar.gz"
    sha256 "5e9b22ed9ca3d450cda83d5664965b84c4c739219a30342a35dbfe3a255a583c"
  end
  version "4070.0.0"
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
