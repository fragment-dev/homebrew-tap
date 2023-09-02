require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3475.0.0-darwin-x64.tar.gz"
    sha256 "eefea685c047016045b301bad17a6f7f0859568e7931d9f66d807fadcd41d99f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3475.0.0-darwin-arm64.tar.gz"
      sha256 "9d289357a113e847c6e0f689558deaa9de246f631d09bc99c9721966f2f1fe91"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3475.0.0-linux-x64.tar.gz"
    sha256 "acf2bbd96164b410d58294f96924dcf2e3a6a34bd08bba75d8b9ec6942ae05f9"
  end
  version "3475.0.0"
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
