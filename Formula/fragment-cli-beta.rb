require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6019.0.0-darwin-x64.tar.gz"
    sha256 "4463e66db889b52d4901f95e7420a2e2f4a953035ea89f428ff503bd753fb0a1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6019.0.0-darwin-arm64.tar.gz"
      sha256 "cbe08f48f71578f2ed648bfcd66a05f38e2a85b143792d28fd02d406d5c2b99c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6019.0.0-linux-x64.tar.gz"
    sha256 "e68cbb9c32e8e1cb4b1a70e89d23b3f08ec115cd232bc8e164d88d8c40670e85"
  end
  version "6019.0.0"
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
