require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3138.0.0-darwin-x64.tar.gz"
    sha256 "0525b84e36b93d8452543ee06335007f61b0ec2f9e725ae2df0e41403930e2b4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3138.0.0-darwin-arm64.tar.gz"
      sha256 "6feb8a95b26dd09e85a5a1eef99d07f9ba6ea07070cc1e09a076198b64bf6e6c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3138.0.0-linux-x64.tar.gz"
    sha256 "5035718ee2af16aa9164ec27d604c61e5ead54089636b76d318285a2f9c46eac"
  end
  version "3138.0.0"
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
