require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3430.0.0-darwin-x64.tar.gz"
    sha256 "28d6c8963b704206ef6518de87e7248ae4faf55ad12194ed9e158fdd84952706"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3430.0.0-darwin-arm64.tar.gz"
      sha256 "ffdf176e869551afb49a2fbea15b5cca0cb9ecf56da2180a56cc4812259b5e57"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3430.0.0-linux-x64.tar.gz"
    sha256 "10c97ca5587eefc0ce706dc7e60eb398bf6846ffa8783c4a27e2635b5be6c338"
  end
  version "3430.0.0"
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
