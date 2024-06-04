require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5195.0.0-darwin-x64.tar.gz"
    sha256 "04b37f2ab54a5108ee75e492e075c47973f00cfc87f84e4d4a93fd587461f097"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5195.0.0-darwin-arm64.tar.gz"
      sha256 "df5af5e667352be648f28d11eae7b6a515ed17155c985b5d1ea78f24237cd013"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5195.0.0-linux-x64.tar.gz"
    sha256 "31c59b9e7c526a5b1780fafd281bf76cb1b48b024c108c1176f1689ecf7a5be4"
  end
  version "5195.0.0"
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
