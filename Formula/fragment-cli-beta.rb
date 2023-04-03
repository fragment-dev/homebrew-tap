require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2338.0.0-darwin-x64.tar.gz"
    sha256 "f5dabdfef68447387ca4a9cf51a74a55cff8274f2cfbd1a4befbbb4f1073be9b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2338.0.0-darwin-arm64.tar.gz"
      sha256 "fb9eb567f2d809c5f6b94fba453b2d1b13f8795dd1b89558267fc5c8eb9767d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2338.0.0-linux-x64.tar.gz"
    sha256 "d21a00acb2ed19c2b6e36c534c54d2cd54790a47c97b15f991cfba163e7fdd42"
  end
  version "2338.0.0"
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
