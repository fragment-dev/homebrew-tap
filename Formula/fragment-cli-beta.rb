require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2351.0.0-darwin-x64.tar.gz"
    sha256 "e9f3fce6ca788323e3d19cf0b0e571f147bcafe6422dedb4ecb4ae039ef99152"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2351.0.0-darwin-arm64.tar.gz"
      sha256 "2765853e2315d0191bbb7935bc07dfab2333fd1cd746c59fb23a407c7b303da4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2351.0.0-linux-x64.tar.gz"
    sha256 "aa8cf211539eb42f7794cad8929136299bd926620130d8f44855c99e7e01d178"
  end
  version "2351.0.0"
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
