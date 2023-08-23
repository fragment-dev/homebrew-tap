require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3374.0.0-darwin-x64.tar.gz"
    sha256 "ec48438f69de3b4864d8fbe870f8c37cfdb69c3b0b845eaa8df9ce0bd43d37d5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3374.0.0-darwin-arm64.tar.gz"
      sha256 "2b2a6485c07d0d5618ddb3bebb3b101f81a0e49f08e43dcfbe3e67ad0567eaa3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3374.0.0-linux-x64.tar.gz"
    sha256 "0c746e811dd5e279c172452b033ebf127775d219f556e31ce80d5f98561b2b14"
  end
  version "3374.0.0"
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
