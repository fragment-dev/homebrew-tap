require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5691.0.0-darwin-x64.tar.gz"
    sha256 "aa6487c7d308567ba118d36eb91daf2f973f5563a6f226fbed8ddedeef886ffa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5691.0.0-darwin-arm64.tar.gz"
      sha256 "43e9dd21cf2f8f30698a50d1a1bf6a907c1414315080ed9ee136b6cdfaf770f6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5691.0.0-linux-x64.tar.gz"
    sha256 "1095e93bddefe9274457cfe890b1525cd163d2413e8dca2c921e2975aa4501fd"
  end
  version "5691.0.0"
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
