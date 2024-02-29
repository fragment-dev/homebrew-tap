require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4676.0.0-darwin-x64.tar.gz"
    sha256 "8521802641a63c1ddc39b7185aa5258cc51bcb292a2cc7ff4eb72c69f85ca128"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4676.0.0-darwin-arm64.tar.gz"
      sha256 "204d28c07834709c92426d624f531ef4c7ecabb202246eea515a59feb2353fc8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4676.0.0-linux-x64.tar.gz"
    sha256 "d9ac0257b9372bc26b1c4464088bb390112ffe8cd2ab5e89613873fef1624d5d"
  end
  version "4676.0.0"
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
