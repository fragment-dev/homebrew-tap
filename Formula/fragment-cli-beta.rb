require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2717.0.0-darwin-x64.tar.gz"
    sha256 "e4593d9bdb98e366fbc6171d7803c8f5dc9f731da894b9d290951d9734801ef8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2717.0.0-darwin-arm64.tar.gz"
      sha256 "ee7a028217359f7d85b7421c318c7176728299977e8281923b2832dd31bc04bd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2717.0.0-linux-x64.tar.gz"
    sha256 "0bd5a341ada84a7746ee38e1a88f81220f11832af2a08fba5a2bc8240f46f1e2"
  end
  version "2717.0.0"
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
