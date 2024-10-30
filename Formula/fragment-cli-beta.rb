require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5712.0.0-darwin-x64.tar.gz"
    sha256 "a40b2f00e0d82f91e133ca97033ec83c076deb59ec7863729e4ee2b8ada34fc1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5712.0.0-darwin-arm64.tar.gz"
      sha256 "9002cedde3bc346c06f28cdd33ffceb06a8ce56a95c19d16af54a8bd976685cf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5712.0.0-linux-x64.tar.gz"
    sha256 "52eb0493b3a614843841c5b369832683e00c3fde4aa768c0814fe7a98b586801"
  end
  version "5712.0.0"
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
