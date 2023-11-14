require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4008.0.0-darwin-x64.tar.gz"
    sha256 "3795dbea9f37d33247198eef395c1e8c487258bb3b646e7449fa66d7c9c7eabe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4008.0.0-darwin-arm64.tar.gz"
      sha256 "8b89bbc973fd5a6a0eaad69831dc44e64ade496c783d86fe96afe4001c8fef71"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4008.0.0-linux-x64.tar.gz"
    sha256 "31bc3e42b6077790384bdf5b978aab2285cda154704910feeb93eb1d3f30ad15"
  end
  version "4008.0.0"
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
