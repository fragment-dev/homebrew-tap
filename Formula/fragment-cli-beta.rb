require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4458.0.0-darwin-x64.tar.gz"
    sha256 "9581b55e75f23d5c215f80768f000988065b6541afb50fedd6d7baa1b18f6a33"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4458.0.0-darwin-arm64.tar.gz"
      sha256 "f5321c1d972cf7e7c5911a110776d64d4d9f9ed91274ff25bc39b79bdafbb2c5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4458.0.0-linux-x64.tar.gz"
    sha256 "472057dd87a9633ce2b3940986ff9db9de57dfd5aacc91911e102fd30b3867c0"
  end
  version "4458.0.0"
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
