require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5801.0.0-darwin-x64.tar.gz"
    sha256 "96a1e841c4c014b548f800d6e3a7a50275d30e10d9b5bd446d75395b3982bb12"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5801.0.0-darwin-arm64.tar.gz"
      sha256 "32504ee298214e627e2838438e3f33f5fb5be3c7c44ef20183eaa976a3a02a92"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5801.0.0-linux-x64.tar.gz"
    sha256 "5e092ad3038bce53058b4a2030b6c71361ed22c38e7c6893a486fd09f05880fb"
  end
  version "5801.0.0"
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
