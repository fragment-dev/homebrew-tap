require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2425.0.0-darwin-x64.tar.gz"
    sha256 "d6eaf5d234171a3796e47bbfb040d653397acc7c512ce30e44a2be0dc785eeb7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2425.0.0-darwin-arm64.tar.gz"
      sha256 "054c1f1aa9ca7443a43734ea86f24b10a884c4dfc4f391f0313a9744dc83f08e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2425.0.0-linux-x64.tar.gz"
    sha256 "2d73f47a48c9085c7bca9b39cb1c1fd7996b236ded7e6873b83a85fddeedaa08"
  end
  version "2425.0.0"
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
