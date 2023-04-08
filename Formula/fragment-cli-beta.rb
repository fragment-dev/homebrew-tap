require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2387.0.0-darwin-x64.tar.gz"
    sha256 "8f6d9a977e975f5e7996eb0964b7d43af4053136c3630779a67044d5bc8585c5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2387.0.0-darwin-arm64.tar.gz"
      sha256 "53e29167423f3c7b93754c5e4426720fd57b5a700834cf3811756aaaa81f86a8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2387.0.0-linux-x64.tar.gz"
    sha256 "ef810af7706a1b22578a06cf07813999990a7009f6c34256c6e3af27c1067cbf"
  end
  version "2387.0.0"
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
