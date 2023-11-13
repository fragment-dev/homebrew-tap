require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4003.0.0-darwin-x64.tar.gz"
    sha256 "25fe37ce0b34aad1c1ac66897d74c4164b14ba5d06677c139e6052a467ae0b5e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4003.0.0-darwin-arm64.tar.gz"
      sha256 "50362d1d5edacc8e6e2866b7c96179bfb617f6aba51b1605306a6bbaf691c448"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4003.0.0-linux-x64.tar.gz"
    sha256 "3b8f887b54aa76e93fc156328f8608c85e71bbb6d06b59e94b13d6d98f886eaf"
  end
  version "4003.0.0"
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
