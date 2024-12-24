require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5975.0.0-darwin-x64.tar.gz"
    sha256 "7d462d246738100a198b9e77c59d7ac3f0b42bdee82dfd19a2fb7cb768eb6537"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5975.0.0-darwin-arm64.tar.gz"
      sha256 "ee6ba7a5941ea633a4e34be6e75190fc636ef034e866cb0542dbd96070d5b81e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5975.0.0-linux-x64.tar.gz"
    sha256 "a477d4136d123f6e778f28a5a6b1da2bf2ea14d5abec1220326de350600bd6c4"
  end
  version "5975.0.0"
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
