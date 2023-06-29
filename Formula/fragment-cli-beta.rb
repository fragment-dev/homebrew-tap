require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2975.0.0-darwin-x64.tar.gz"
    sha256 "ea75a4bc8d408a748cfcda955a12cbb5fce87c25fc59055e6b836a7c7a7b1fc6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2975.0.0-darwin-arm64.tar.gz"
      sha256 "200e3d141b58b44d0835a69cbc55649d1285719dbebd01e508bbf8208feda457"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2975.0.0-linux-x64.tar.gz"
    sha256 "b3a0f2f6b991b08e03820d3ff833d2ddcf6429d5dbba722a17281381810750e7"
  end
  version "2975.0.0"
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
