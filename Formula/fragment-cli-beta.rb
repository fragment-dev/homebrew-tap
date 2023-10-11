require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3803.0.0-darwin-x64.tar.gz"
    sha256 "7d45ccd12af3e8e113335bb3f37b930facb1fc4833435cfe38369f0e019fc43a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3803.0.0-darwin-arm64.tar.gz"
      sha256 "99b7963355c9d5e3a67f8d4c55b0b9e4bc0e7e9f86013383f63d746b1e53cd15"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3803.0.0-linux-x64.tar.gz"
    sha256 "43f4d5d167999196dfe57b2dac4c991b80264dfcafcb8bd8085838936a72427f"
  end
  version "3803.0.0"
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
