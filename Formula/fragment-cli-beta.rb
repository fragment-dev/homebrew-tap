require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3686.0.0-darwin-x64.tar.gz"
    sha256 "03cf3764bb20572fb41ccf76d3195f515d496aaa9bd845892dc6a69b6d037a64"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3686.0.0-darwin-arm64.tar.gz"
      sha256 "ab278994d67c7c1537db040bc7bc1e6ef93814e7bfc511855bf96046578f196e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3686.0.0-linux-x64.tar.gz"
    sha256 "cbb9cb4b0e8d4cfd36e0b0d065c7452b93d58eb2538b324f01e61ecbc20b6e89"
  end
  version "3686.0.0"
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
