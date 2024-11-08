require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5753.0.0-darwin-x64.tar.gz"
    sha256 "2ec8f9aa66c77e5b9f23dc3038dcdc06842d3f5c734c8110dcac3d33949bff8a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5753.0.0-darwin-arm64.tar.gz"
      sha256 "0aecb27909e5e6274e889795881f86b69b3a82e173875497904f29ac23142125"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5753.0.0-linux-x64.tar.gz"
    sha256 "d005644dc93e45fc8a382a8adc24c9ded9914e230053118cc50d99eca473c2f1"
  end
  version "5753.0.0"
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
