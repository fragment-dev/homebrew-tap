require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5711.0.0-darwin-x64.tar.gz"
    sha256 "37a19e2937b1f232eb2c352f116ed279aedc16446ee69bf9c66699c1d1f47c02"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5711.0.0-darwin-arm64.tar.gz"
      sha256 "358e7a5ad59e037e0eb757876170fb1db5173aab17cba428aeea5c2f8088d762"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5711.0.0-linux-x64.tar.gz"
    sha256 "2cc273733d969686d83b9deb75c19b56e79808f51f393367afa253f4836eceaa"
  end
  version "5711.0.0"
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
