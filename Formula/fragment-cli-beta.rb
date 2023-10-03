require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3740.0.0-darwin-x64.tar.gz"
    sha256 "892f1e98f649c69e6c3e773c90d278f1260e5c2c2bd5f702ff43fff9ff893794"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3740.0.0-darwin-arm64.tar.gz"
      sha256 "9f1df9282d9e4e0ca4cbf27a68d9560914138efa4ea45c556478ad897f2df44e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3740.0.0-linux-x64.tar.gz"
    sha256 "ec2c116cfbba3ff4af9cde80f14dcffe47c87ade40b9ffbb9cd79647670a0b7f"
  end
  version "3740.0.0"
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
