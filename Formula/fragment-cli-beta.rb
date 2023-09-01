require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3474.0.0-darwin-x64.tar.gz"
    sha256 "1b40d1a18ca6d611bd6a05a2f4ba54b1e2f97154602c04b8ab5dc86751a33457"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3474.0.0-darwin-arm64.tar.gz"
      sha256 "48fd61f4104dc45955282f1be2394bd7b9cf901b86326eeba7317f09b995680b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3474.0.0-linux-x64.tar.gz"
    sha256 "0a206b2fe31e85631c575e6dd6ff75fe53738327cccda6bb32b00757eb0621c3"
  end
  version "3474.0.0"
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
