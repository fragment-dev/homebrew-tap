require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3596.0.0-darwin-x64.tar.gz"
    sha256 "34574f6ac41461bdcd1385dc3fd8d9b5dcdcc6f051c775cbd7db85ae98b38fd5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3596.0.0-darwin-arm64.tar.gz"
      sha256 "f72cff7a730c381c1854d4b927366aa79a0486f2afa9cac2a64b2903220eceda"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3596.0.0-linux-x64.tar.gz"
    sha256 "5c040533f1fd40e85e204b85677ad030a82ba118f12ad6bb5629d6a37ae64d81"
  end
  version "3596.0.0"
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
