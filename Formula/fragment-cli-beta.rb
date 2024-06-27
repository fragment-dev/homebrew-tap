require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5320.0.0-darwin-x64.tar.gz"
    sha256 "7639b484ef6413cf027394e4527666b7af8dd477738667ec6cf6bf4709f43f02"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5320.0.0-darwin-arm64.tar.gz"
      sha256 "50ecdf28f8ddcce3613d8af26e2679b8aa1296f81b82beec7458a815d3742ee3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5320.0.0-linux-x64.tar.gz"
    sha256 "6fb9eef87f52d6efdd655117d165545d4cec2d8ec6bfca537a62783087120350"
  end
  version "5320.0.0"
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
